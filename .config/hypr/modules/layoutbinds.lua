-- Scrolling layout — move view
hl.bind("ALT + period", hl.dsp.layout("move +col"))
hl.bind("ALT + comma", hl.dsp.layout("move -col"))

-- Swap columns
hl.bind("ALT + H", hl.dsp.layout("swapcol l"))
hl.bind("ALT + L", hl.dsp.layout("swapcol r"))

-- Column resize
hl.bind("ALT + minus", hl.dsp.layout("colresize -0.1"))
hl.bind("ALT + equal", hl.dsp.layout("colresize +0.1"))
hl.bind("ALT + R", hl.dsp.layout("colresize +conf"))
hl.bind("ALT + SHIFT + R", hl.dsp.layout("colresize -conf"))

-- Column ops
hl.bind("ALT + P", hl.dsp.layout("promote"))
hl.bind("ALT + C", hl.dsp.layout("consume"))
hl.bind("ALT + X", hl.dsp.layout("expel"))
hl.bind("ALT + E", hl.dsp.layout("consume_or_expel"))

-- Fit
hl.bind("ALT + F", hl.dsp.layout("fit active"))
hl.bind("ALT + SHIFT + F", hl.dsp.layout("fit expand"))
hl.bind("ALT + V", hl.dsp.layout("fit_into_view"))

-- Inhibit scroll
hl.bind("ALT + I", hl.dsp.layout("inhibit_scroll"))
