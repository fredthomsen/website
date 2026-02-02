# Agent Guidelines

## Core Principles

1. **Be idiomatic with Hugo** - Use Hugo's built-in features, conventions, and templating patterns
2. **Efficiency first** - Make changes in the most direct way possible; avoid unnecessary abstractions
3. **Respect the theme** - Override PaperMod via `layouts/` and `assets/css/extended/`, never modify theme files directly

## Project Structure

- `src/` - Hugo source directory
- `src/layouts/` - Custom layout overrides
- `src/assets/css/extended/custom.css` - All custom styling
- `src/content/` - Markdown content (experience.md, skills.md)
- `src/hugo.toml` - Hugo configuration

## Key Decisions

- Single-page scrolling layout (no navigation)
- Dark mode only (theme toggle disabled)
- GSAP for scroll animations (`layouts/partials/extend_footer.html`)
- Custom HTML allowed in markdown content

## Making Changes

| Change Type | Location |
|-------------|----------|
| Styling | `src/assets/css/extended/custom.css` |
| Layout/structure | `src/layouts/` |
| Content | `src/content/*.md` |
| Site config | `src/hugo.toml` |
| Animations | `src/layouts/partials/extend_footer.html` |
