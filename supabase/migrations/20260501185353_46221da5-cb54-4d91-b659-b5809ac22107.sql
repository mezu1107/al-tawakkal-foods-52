-- Delivery settings (single row with main shop location + free radius)
CREATE TABLE public.delivery_settings (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  center_name TEXT NOT NULL DEFAULT 'PWD Islamabad',
  center_lat NUMERIC NOT NULL DEFAULT 33.5651,
  center_lng NUMERIC NOT NULL DEFAULT 73.1486,
  free_radius_km NUMERIC NOT NULL DEFAULT 7,
  base_delivery_charges NUMERIC NOT NULL DEFAULT 0,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE public.delivery_settings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view delivery settings"
  ON public.delivery_settings FOR SELECT
  USING (true);

CREATE POLICY "Admins can update delivery settings"
  ON public.delivery_settings FOR UPDATE
  TO authenticated
  USING (has_role(auth.uid(), 'admin'::app_role));

CREATE POLICY "Admins can insert delivery settings"
  ON public.delivery_settings FOR INSERT
  TO authenticated
  WITH CHECK (has_role(auth.uid(), 'admin'::app_role));

CREATE TRIGGER update_delivery_settings_updated_at
  BEFORE UPDATE ON public.delivery_settings
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

-- Seed one row
INSERT INTO public.delivery_settings (center_name, center_lat, center_lng, free_radius_km, base_delivery_charges)
VALUES ('PWD Islamabad', 33.5651, 73.1486, 7, 0);

-- Delivery areas (extra named pockets outside the free radius)
CREATE TABLE public.delivery_areas (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  lat NUMERIC NOT NULL,
  lng NUMERIC NOT NULL,
  radius_km NUMERIC NOT NULL DEFAULT 1,
  delivery_charges NUMERIC NOT NULL DEFAULT 0,
  active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE public.delivery_areas ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view active delivery areas"
  ON public.delivery_areas FOR SELECT
  USING (active = true);

CREATE POLICY "Admins can view all delivery areas"
  ON public.delivery_areas FOR SELECT
  TO authenticated
  USING (has_role(auth.uid(), 'admin'::app_role));

CREATE POLICY "Admins can insert delivery areas"
  ON public.delivery_areas FOR INSERT
  TO authenticated
  WITH CHECK (has_role(auth.uid(), 'admin'::app_role));

CREATE POLICY "Admins can update delivery areas"
  ON public.delivery_areas FOR UPDATE
  TO authenticated
  USING (has_role(auth.uid(), 'admin'::app_role));

CREATE POLICY "Admins can delete delivery areas"
  ON public.delivery_areas FOR DELETE
  TO authenticated
  USING (has_role(auth.uid(), 'admin'::app_role));

CREATE TRIGGER update_delivery_areas_updated_at
  BEFORE UPDATE ON public.delivery_areas
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();