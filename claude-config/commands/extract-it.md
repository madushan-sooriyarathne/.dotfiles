# UX/UI Style Guide Creation Prompt

Repeat this exercise for each of the respective groups of images found in design-system/ref-images (you should spend time discerning and grouping them into which app they belong to based on style and aesthetic).

The user likes $ARGUMENTS about each set of images

You are an expert UX/UI designer. Your job is to fill out a style guide based on the below format. You are making the guide based on the attached images. Before you respond, though, wrap your entire thought process in `<pondering>` tags. Once your complete in thinking, dump at the top of the output file your Pondering analysis under an H2. Obviously, you're a heady-artistic type, so you're thinking about the app, it's aesthetics, principles it conforms to, how that makes the user feel a certain way, etc. Here's the output format as an example. Add or subtract if need be from it:

## Color Palette

### Primary Colors

- **Primary White** - `#F8F9FA` (Used for backgrounds and clean surfaces)
- **Primary Dark Green** - `#0A5F55` (Primary brand color for buttons, icons, and emphasis)

### Secondary Colors

- **Secondary Green Light** - `#4CAF94` (For hover states and secondary elements)
- **Secondary Green Pale** - `#E6F4F1` (For backgrounds, selected states, and highlights)

### Accent Colors

- **Accent Teal** - `#00BFA5` (For important actions and notifications)
- **Accent Yellow** - `#FFD54F` (For warnings and highlights)

### Functional Colors

- **Success Green** - `#43A047` (For success states and confirmations)
- **Error Red** - `#E53935` (For errors and destructive actions)
- **Neutral Gray** - `#9E9E9E` (For secondary text and disabled states)
- **Dark Gray** - `#424242` (For primary text)

### Background Colors

- **Background White** - `#FFFFFF` (Pure white for cards and content areas)
- **Background Light** - `#F5F7F9` (Subtle off-white for app background)
- **Background Dark** - `#263238` (For dark mode primary background)

## Typography

### Font Family

- **Primary Font:** SF Pro Text (iOS) / Roboto (Android)
- **Alternative Font:** Inter (Web fallback)

### Font Weights

- **Regular:** 400
- **Medium:** 500
- **Semibold:** 600
- **Bold:** 700

### Text Styles

#### Headings

- **H1:** 28px/32px, Bold, Letter spacing -0.2px
  - Used for screen titles and major headers
- **H2:** 24px/28px, Bold, Letter spacing -0.2px
  - Used for section headers and card titles
- **H3:** 20px/24px, Semibold, Letter spacing -0.1px
  - Used for subsection headers and important text

#### Body Text

- **Body Large:** 17px/24px, Regular, Letter spacing 0px
  - Primary reading text for transcript content
- **Body:** 15px/20px, Regular, Letter spacing 0px
  - Standard text for most UI elements
- **Body Small:** 13px/18px, Regular, Letter spacing 0.1px
  - Secondary information and supporting text

#### Special Text

- **Caption:** 12px/16px, Medium, Letter spacing 0.2px
  - Used for timestamps, metadata, and labels
- **Button Text:** 16px/24px, Medium, Letter spacing 0.1px
  - Used specifically for buttons and interactive elements
- **Link Text:** 15px/20px, Medium, Letter spacing 0px, Primary Dark Green
  - Clickable text throughout the application

## Component Styling

### Buttons

#### Primary Button

- **Background:** Primary Dark Green (`#0A5F55`)
- **Text:** White (`#FFFFFF`)
- **Height:** 48dp
- **Corner Radius:** 8dp
- **Padding:** 16dp horizontal

#### Secondary Button

- **Border:** 1.5dp Primary Dark Green (`#0A5F55`)
- **Text:** Primary Dark Green (`#0A5F55`)
- **Background:** Transparent
- **Height:** 48dp
- **Corner Radius:** 8dp

#### Text Button

- **Text:** Primary Dark Green (`#0A5F55`)
- No background or border
- **Height:** 44dp

### Cards

- **Background:** White (`#FFFFFF`)
- **Shadow:** Y-offset 2dp, Blur 8dp, Opacity 8%
- **Corner Radius:** 12dp
- **Padding:** 16dp

### Input Fields

- **Height:** 56dp
- **Corner Radius:** 8dp
- **Border:** 1dp Neutral Gray (`#9E9E9E`)
- **Active Border:** 2dp Primary Dark Green (`#0A5F55`)
- **Background:** White (`#FFFFFF`)
- **Text:** Dark Gray (`#424242`)
- **Placeholder Text:** Neutral Gray (`#9E9E9E`)

### Icons

- **Primary Icons:** 24dp x 24dp
- **Small Icons:** 20dp x 20dp
- **Navigation Icons:** 28dp x 28dp
- **Primary color for interactive icons:** Primary Dark Green (`#0A5F55`)
- **Secondary color for inactive/decorative icons:** Neutral Gray (`#9E9E9E`)

## Spacing System

- **4dp** - Micro spacing (between related elements)
- **8dp** - Small spacing (internal padding)
- **16dp** - Default spacing (standard margins)
- **24dp** - Medium spacing (between sections)
- **32dp** - Large spacing (major sections separation)
- **48dp** - Extra large spacing (screen padding top/bottom)

## Motion & Animation

- **Standard Transition:** 200ms, Ease-out curve
- **Emphasis Transition:** 300ms, Spring curve (tension: 300, friction: 35)
- **Microinteractions:** 150ms, Ease-in-out
- **Page Transitions:** 350ms, Custom cubic-bezier(0.2, 0.8, 0.2, 1)

## Dark Mode Variants

- **Dark Background:** `#121212` (primary dark background)
- **Dark Surface:** `#1E1E1E` (card backgrounds)
- **Dark Primary Green:** `#26A69A` (adjusted for contrast)
- **Dark Text Primary:** `#EEEEEE`
- **Dark Text Secondary:** `#B0BEC5`

## Outputs

Place your output analysis inside of design-system/competitor-analysis.md
