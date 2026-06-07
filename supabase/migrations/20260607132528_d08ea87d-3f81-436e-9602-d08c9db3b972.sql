
-- 1. Drop user self-insert on coupon_redemptions and loyalty_transactions (privilege escalation)
DROP POLICY IF EXISTS "Users insert own redemptions" ON public.coupon_redemptions;
DROP POLICY IF EXISTS "Users insert own loyalty" ON public.loyalty_transactions;

-- 2. Restrict coupons SELECT - drop public read, allow authenticated only
DROP POLICY IF EXISTS "Anyone can view active coupons" ON public.coupons;
CREATE POLICY "Authenticated users can view active coupons"
ON public.coupons FOR SELECT TO authenticated
USING (active = true);

-- 3. Restrict rider_settings to rider or admin role
DROP POLICY IF EXISTS "Anyone authenticated can view rider settings" ON public.rider_settings;
CREATE POLICY "Riders and admins can view rider settings"
ON public.rider_settings FOR SELECT TO authenticated
USING (has_role(auth.uid(), 'rider'::app_role) OR has_role(auth.uid(), 'admin'::app_role));

-- 4. Prevent users from modifying sensitive order fields via trigger
CREATE OR REPLACE FUNCTION public.prevent_user_order_field_changes()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  -- Admins and riders bypass via separate policies; only restrict non-privileged owner updates
  IF has_role(auth.uid(), 'admin'::app_role) OR has_role(auth.uid(), 'rider'::app_role) THEN
    RETURN NEW;
  END IF;
  IF NEW.status IS DISTINCT FROM OLD.status
     OR NEW.total IS DISTINCT FROM OLD.total
     OR NEW.subtotal IS DISTINCT FROM OLD.subtotal
     OR NEW.discount_amount IS DISTINCT FROM OLD.discount_amount
     OR NEW.delivery_charges IS DISTINCT FROM OLD.delivery_charges
     OR NEW.rider_id IS DISTINCT FROM OLD.rider_id
     OR NEW.points_earned IS DISTINCT FROM OLD.points_earned
     OR NEW.points_redeemed IS DISTINCT FROM OLD.points_redeemed
     OR NEW.coupon_code IS DISTINCT FROM OLD.coupon_code
     OR NEW.user_id IS DISTINCT FROM OLD.user_id THEN
    RAISE EXCEPTION 'Customers cannot modify protected order fields';
  END IF;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS guard_user_order_updates ON public.orders;
CREATE TRIGGER guard_user_order_updates
BEFORE UPDATE ON public.orders
FOR EACH ROW EXECUTE FUNCTION public.prevent_user_order_field_changes();

-- 5. Restrict deals-images storage bucket to admin for write/delete
DROP POLICY IF EXISTS "Allow image upload for deals" ON storage.objects;
DROP POLICY IF EXISTS "Allow upload" ON storage.objects;
DROP POLICY IF EXISTS "Allow delete deals images" ON storage.objects;

CREATE POLICY "Admins upload deals images"
ON storage.objects FOR INSERT TO authenticated
WITH CHECK (bucket_id = 'deals-images' AND has_role(auth.uid(), 'admin'::app_role));

CREATE POLICY "Admins delete deals images"
ON storage.objects FOR DELETE TO authenticated
USING (bucket_id = 'deals-images' AND has_role(auth.uid(), 'admin'::app_role));

CREATE POLICY "Admins update deals images"
ON storage.objects FOR UPDATE TO authenticated
USING (bucket_id = 'deals-images' AND has_role(auth.uid(), 'admin'::app_role));

-- 6. Restrict EXECUTE on SECURITY DEFINER functions from anon
REVOKE EXECUTE ON FUNCTION public.has_role(uuid, app_role) FROM anon, public;
GRANT EXECUTE ON FUNCTION public.has_role(uuid, app_role) TO authenticated;
REVOKE EXECUTE ON FUNCTION public.handle_new_user() FROM anon, authenticated, public;
REVOKE EXECUTE ON FUNCTION public.update_updated_at_column() FROM anon, public;
