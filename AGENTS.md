# Claude Development Guide for Personal Website

This document provides comprehensive information for working with this Hugo-based personal website project.

## Project Overview

This is a personal portfolio website built with Hugo static site generator and deployed to GitHub Pages. The site uses the PaperMod theme with extensive customizations for a single-page scrolling experience showcasing professional experience and technical skills.

## Project Structure

```
personal_website/
├── .devcontainer/           # Docker development environment
│   └── docker-compose.yml   # Hugo development server configuration
├── .github/
│   └── workflows/
│       └── deploy.yml       # GitHub Actions workflow for deployment
├── src/                     # Hugo source directory
│   ├── archetypes/          # Content templates
│   ├── assets/              # Custom CSS and assets
│   │   └── css/
│   │       └── extended/
│   │           └── custom.css
│   ├── content/             # Markdown content files
│   │   ├── experience.md    # Professional experience with descriptions
│   │   └── skills.md        # Technical skills with proficiency levels
│   ├── layouts/             # Custom layout overrides
│   │   ├── index.html       # Single-page homepage layout
│   │   └── partials/
│   │       ├── extend_footer.html  # GSAP animation scripts
│   │       └── header.html         # Minimal header (no nav)
│   ├── public/              # Generated static site (git ignored)
│   ├── themes/              # Hugo themes directory
│   │   └── PaperMod/        # Base theme
│   └── hugo.toml            # Hugo configuration
├── .gitignore               # Git ignore rules
├── Makefile                 # Build and development commands
└── README.md                # Basic project description
```

## Development Setup

### Prerequisites
- Docker and Docker Compose (for local development)
- Git

### Local Development Server

Start the development server using Docker:
```bash
make serve
```

This command:
- Runs `docker compose -f .devcontainer/docker-compose.yml up -d`
- Starts a Hugo development server at http://localhost:1313
- Uses the `hugomods/hugo:ci` Docker image
- Mounts the `src` directory as a volume
- Enables live reload with `--disableFastRender`
- Sets baseURL to `http://localhost:1313` for proper local links

To stop the development server:
```bash
make clean
```

## Building the Site

To build the static site for production:
```bash
make build
```

This command:
- Changes to the `src` directory
- Runs `hugo build --minify`
- Generates optimized static files in `src/public/`

## Site Architecture

### Single-Page Layout

The site uses a custom single-page layout (`src/layouts/index.html`) with three sections:

1. **Hero Section** (100vh)
   - Profile image
   - Name and tagline
   - Social media links
   - Bouncing scroll indicator arrow

2. **Experience Section**
   - Vertical timeline with animated reveal
   - Hover-to-expand position descriptions
   - Each position includes summary and bullet points

3. **Skills Section**
   - Grid of skill cards
   - SVG radial progress indicators
   - Scroll-triggered animations

### Animations

GSAP (GreenSock) powers the scroll animations via `src/layouts/partials/extend_footer.html`:
- Skill cards fade in with staggered timing
- Radial progress circles animate to show proficiency
- Timeline items reveal from left on scroll
- All animations trigger at 85% viewport entry

### Theme Customizations

The site overrides PaperMod theme behavior:
- `src/layouts/partials/header.html` - Removes navigation bar, forces dark mode
- `src/layouts/index.html` - Custom single-page homepage
- `src/assets/css/extended/custom.css` - All custom styling

## Configuration

### Hugo Configuration (`src/hugo.toml`)
- **Base URL**: https://fredthomsen.net/
- **Theme**: PaperMod
- **Default Theme**: Dark mode (theme toggle disabled)
- **Profile Mode**: Enabled with custom image from S3
- **Navigation**: Disabled (single-page layout)
- **Header Label**: Empty (no site title in header)

### Content Structure

#### Experience (`src/content/experience.md`)
- Timeline HTML structure with `.timeline-item` divs
- Each position has title, company, date, and description
- Descriptions use `.timeline-description` with `<p>` and `<ul>` elements
- Hidden by default, revealed on hover via CSS

#### Skills (`src/content/skills.md`)
- Grid of `.skill-card` divs with `data-percent` attributes
- Each card contains SVG radial progress indicator
- Proficiency levels: Python (100%), Airflow (100%), Linux (80%), Git (80%), Kubernetes (75%), C++ (75%), C (75%), Go (50%)

## Making Changes

### Modify Experience Descriptions
Edit `src/content/experience.md`:
- Update text within `.timeline-description` divs
- Add/remove bullet points in `<ul>` elements

### Modify Skills
Edit `src/content/skills.md`:
- Change `data-percent` attribute for proficiency level
- Add/remove `.skill-card` divs for new skills

### Update Profile
Edit `src/hugo.toml`:
- `params.profileMode.imageUrl` - Profile image URL
- `params.homeInfoParams.Content` - Tagline text
- `params.socialIcons` - Social media links

### Modify Animations
Edit `src/layouts/partials/extend_footer.html`:
- Adjust timing, easing, or trigger points
- GSAP ScrollTrigger configuration

### Modify Styling
Edit `src/assets/css/extended/custom.css`:
- Hero section: `.hero`, `.hero-content`, `.scroll-indicator`
- Timeline: `.timeline`, `.timeline-item`, `.timeline-description`
- Skills: `.skills-grid`, `.skill-card`, `.progress-ring`

## Deployment

### GitHub Pages Deployment
The site automatically deploys to GitHub Pages when changes are pushed to the `master` branch.

Deployment workflow (`.github/workflows/deploy.yml`):
1. Triggered on push to `master` or manual workflow dispatch
2. Checks out code with submodules
3. Sets up Hugo (latest version, extended)
4. Builds site using `make build`
5. Uploads `src/public/` as artifact
6. Deploys to GitHub Pages

## Troubleshooting

### Development server not starting
- Ensure Docker is running
- Check port 1313 is not in use
- Run `make clean` then `make serve`

### Animations not working
- Check browser console for GSAP errors
- Verify GSAP CDN scripts are loading
- Ensure elements have correct CSS classes

### Hover descriptions not showing
- Verify `.timeline-description` elements exist in content
- Check CSS `max-height` transition is working
- Test with browser dev tools hover state

## Important Notes

- The `src/public/` directory is git-ignored (generated content)
- Theme files should not be modified directly (use layout overrides)
- Custom HTML is allowed in markdown files (unsafe renderer enabled)
- All internal navigation removed; site is single-page scroll
