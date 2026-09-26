# 🏗️ EstiBuild — Smart Construction Estimation Platform

Professional construction estimation for Nepal, India & Dubai — 7 modules,
dimension-driven quantity takeoff, auto BBS (IS 2502), branded Excel/PDF exports.

**Owner:** M&M One Stop Solution Pvt. Ltd. · Kathmandu · 9704095095 · 1stopnp@gmail.com

---

## ✅ This repo must look EXACTLY like this (top level)

```
Dockerfile
render.yaml
README.md
requirements.txt
app.py
db.py
brand.py
country_rates.py
schedule_fw.py
structural_ui.py
input_templates.py
table_reader.py
pdf_parser.py
ai_reader.py
report_excel.py
report_pdf.py
logo.png
logo_faint.png
modules/        (9 files)
structural/     (3 files)
estimation/     (3 files)
```

If you see a single folder (like `code/` or `EstiBuild/`) on the repo front
page instead of this list — the deploy will fail. Re-upload the CONTENTS,
not the folder.

## 🚀 Deploy on Render

1. Render Dashboard → **New + → Blueprint** → select this repo
2. render.yaml configures everything (Docker · Singapore · Free)
3. Enter the two secrets when prompted: `ADMIN_KEY`, `SECRET_KEY` (any long random text)
4. Apply → live in ~3 minutes

Alternative (manual): New + → Web Service → repo → Render shows **"Docker detected"**
→ Region Singapore → Instance Free → Deploy. Set `ADMIN_KEY` and `SECRET_KEY`
in Environment.

## 🔑 Environment variables

| Variable | Purpose |
|----------|---------|
| `ADMIN_KEY` | Owner tool: upgrade paying customers via `/admin/setplan?key=...&email=...&plan=...` |
| `SECRET_KEY` | Session security — set a long random string |
| `OPENAI_API_KEY` | (optional) enables the AI Drawing Reader |

## 🧪 After deploy — 30-second health check

- `/login` opens the login page
- Register an account (email + phone required)
- Any module → Calculate → GRAND TOTAL appears
- Excel + PDF export links work

## 🛠️ Local development

```
pip install -r requirements.txt
python app.py            # http://localhost:8080 (DEMO=1 COOKIE_SECURE=0 for preview)
python full_audit.py     # must stay 110/110 (audit suite is in the developer package)
```
