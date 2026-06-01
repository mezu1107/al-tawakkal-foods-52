
ALTER TABLE public.testimonials ENABLE ROW LEVEL SECURITY;
GRANT SELECT ON public.testimonials TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON public.testimonials TO authenticated;
GRANT ALL ON public.testimonials TO service_role;
CREATE POLICY "Anyone can view approved testimonials" ON public.testimonials FOR SELECT USING (is_approved = true);
CREATE POLICY "Admins view all testimonials" ON public.testimonials FOR SELECT TO authenticated USING (has_role(auth.uid(), 'admin'::app_role));
CREATE POLICY "Admins manage testimonials" ON public.testimonials FOR ALL TO authenticated USING (has_role(auth.uid(), 'admin'::app_role)) WITH CHECK (has_role(auth.uid(), 'admin'::app_role));
CREATE POLICY "Authenticated users can submit testimonials" ON public.testimonials FOR INSERT TO authenticated WITH CHECK (true);
