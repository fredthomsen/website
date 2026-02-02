# Personal Website

Personal portfolio website built with [Hugo](https://gohugo.io/) static site generator and the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme. Deployed to GitHub Pages.

## Prerequisites

- Docker and Docker Compose
- Git

## Development

Start the development server:
```bash
make serve
```
Site available at http://localhost:1313 with live reload.

Stop the server:
```bash
make clean
```

## Build

```bash
make build
```
Generates optimized static files in `src/public/`.

## Deployment

Automatic deployment to GitHub Pages on push to `master` branch via GitHub Actions.

All local development should be done WITHIN devcontainer.

## Project Structure

```
src/
├── assets/css/extended/custom.css  # Custom styling
├── content/                         # Markdown content
│   ├── experience.md               # Professional experience
│   └── skills.md                   # Technical skills
├── layouts/                         # Layout overrides
│   ├── index.html                  # Single-page homepage
│   └── partials/
│       ├── extend_footer.html      # GSAP animations
│       └── header.html             # Minimal header
└── hugo.toml                        # Hugo configuration
```
