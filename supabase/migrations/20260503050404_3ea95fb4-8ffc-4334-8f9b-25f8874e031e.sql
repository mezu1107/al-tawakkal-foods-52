
-- Rider settings (singleton row)
CREATE TABLE public.rider_settings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  commission_percent NUMERIC NOT NULL DEFAULT 10,
  min_payout NUMERIC NOT NULL DEFAULT 1000,
  support_phone TEXT NOT NULL DEFAULT '+923431497982',
  support_whatsapp TEXT NOT NULL DEFAULT '+923431497982',
  payout_schedule TEXT NOT NULL DEFAULT 'weekly',
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE public.rider_settings ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone authenticated can view rider settings" ON public.rider_settings FOR SELECT TO authenticated USING (true);
CREATE POLICY "Admins can insert rider settings" ON public.rider_settings FOR INSERT TO authenticated WITH CHECK (has_role(auth.uid(),'admin'::app_role));
CREATE POLICY "Admins can update rider settings" ON public.rider_settings FOR UPDATE TO authenticated USING (has_role(auth.uid(),'admin'::app_role));
INSERT INTO public.rider_settings DEFAULT VALUES;

-- Notifications
CREATE TABLE public.rider_notifications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  rider_id UUID NOT NULL,
  title TEXT NOT NULL,
  body TEXT NOT NULL DEFAULT '',
  read BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE public.rider_notifications ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Riders view own notifications" ON public.rider_notifications FOR SELECT TO authenticated USING (rider_id = auth.uid());
CREATE POLICY "Riders update own notifications" ON public.rider_notifications FOR UPDATE TO authenticated USING (rider_id = auth.uid());
CREATE POLICY "Admins manage all notifications" ON public.rider_notifications FOR ALL TO authenticated USING (has_role(auth.uid(),'admin'::app_role)) WITH CHECK (has_role(auth.uid(),'admin'::app_role));

-- Documents
CREATE TABLE public.rider_documents (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  rider_id UUID NOT NULL,
  doc_type TEXT NOT NULL,
  file_url TEXT NOT NULL DEFAULT '',
  status TEXT NOT NULL DEFAULT 'pending',
  expiry_date DATE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE public.rider_documents ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Riders view own documents" ON public.rider_documents FOR SELECT TO authenticated USING (rider_id = auth.uid());
CREATE POLICY "Riders insert own documents" ON public.rider_documents FOR INSERT TO authenticated WITH CHECK (rider_id = auth.uid());
CREATE POLICY "Riders update own documents" ON public.rider_documents FOR UPDATE TO authenticated USING (rider_id = auth.uid());
CREATE POLICY "Riders delete own documents" ON public.rider_documents FOR DELETE TO authenticated USING (rider_id = auth.uid());
CREATE POLICY "Admins manage all documents" ON public.rider_documents FOR ALL TO authenticated USING (has_role(auth.uid(),'admin'::app_role)) WITH CHECK (has_role(auth.uid(),'admin'::app_role));

-- Schedule
CREATE TABLE public.rider_schedule (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  rider_id UUID NOT NULL,
  day_of_week INTEGER NOT NULL,
  start_time TEXT NOT NULL DEFAULT '10:00',
  end_time TEXT NOT NULL DEFAULT '22:00',
  available BOOLEAN NOT NULL DEFAULT true,
  UNIQUE(rider_id, day_of_week)
);
ALTER TABLE public.rider_schedule ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Riders manage own schedule" ON public.rider_schedule FOR ALL TO authenticated USING (rider_id = auth.uid()) WITH CHECK (rider_id = auth.uid());
CREATE POLICY "Admins view all schedules" ON public.rider_schedule FOR SELECT TO authenticated USING (has_role(auth.uid(),'admin'::app_role));

-- Support messages
CREATE TABLE public.rider_messages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  rider_id UUID NOT NULL,
  sender TEXT NOT NULL,
  body TEXT NOT NULL,
  read BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE public.rider_messages ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Riders view own messages" ON public.rider_messages FOR SELECT TO authenticated USING (rider_id = auth.uid());
CREATE POLICY "Riders send own messages" ON public.rider_messages FOR INSERT TO authenticated WITH CHECK (rider_id = auth.uid() AND sender = 'rider');
CREATE POLICY "Admins manage all messages" ON public.rider_messages FOR ALL TO authenticated USING (has_role(auth.uid(),'admin'::app_role)) WITH CHECK (has_role(auth.uid(),'admin'::app_role));

-- Payouts
CREATE TABLE public.rider_payouts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  rider_id UUID NOT NULL,
  amount NUMERIC NOT NULL DEFAULT 0,
  period_start DATE,
  period_end DATE,
  status TEXT NOT NULL DEFAULT 'pending',
  paid_at TIMESTAMPTZ,
  notes TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
ALTER TABLE public.rider_payouts ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Riders view own payouts" ON public.rider_payouts FOR SELECT TO authenticated USING (rider_id = auth.uid());
CREATE POLICY "Admins manage all payouts" ON public.rider_payouts FOR ALL TO authenticated USING (has_role(auth.uid(),'admin'::app_role)) WITH CHECK (has_role(auth.uid(),'admin'::app_role));
