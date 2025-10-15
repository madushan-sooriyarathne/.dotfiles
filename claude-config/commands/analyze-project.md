# Claude Command: Analyze Project

This command will analyze the current project and create a detailed llm instruction file.

## Usage

**Primary Objective:** Analyze the current codebase and project structure to create a comprehensive, Markdown-formatted LLM instruction document titled `llm-instruction.md`. This document will serve as a continuous, foundational guide for all future AI-assisted development tasks, ensuring consistency and adherence to project standards.

---

### **Section 1: Project Overview & Structural Analysis**

1.  **Project Identity:** What is the primary purpose and name of this application?
2.  **Core Technology Stack:**
    - **Frontend:** Identify the primary framework/library (e.g., React, Vue, Angular), component library (e.g., Material-UI, Bootstrap), and build tool (e.g., Webpack, Vite).
    - **Backend:** Identify the primary language/runtime (e.g., Node.js, Python, Go), framework (e.g., Express, Django, Spring Boot), and deployment environment/server (e.g., AWS Lambda, Kubernetes, Nginx).
    - **Database:** Identify the type (SQL/NoSQL) and specific technology (e.g., PostgreSQL, MongoDB, Redis).
3.  **Directory Structure Map:** Create a high-level, tree-like structure (max 3 levels deep) mapping the critical directories and their function.
    - _Example:_
      ```
      /src
      |-- /components     (Reusable UI elements)
      |-- /pages          (Main application views)
      |-- /services       (API interaction and business logic)
      |-- /store          (State management files)
      /tests              (Unit and integration tests)
      /config             (Environment variables and build settings)
      ```
4.  **Key Entry Points:** Specify the main file(s) where the application execution begins (e.g., `src/index.js`, `app.py`).

---

### **Section 2: Dependencies and Special-Use Cases**

1.  **Critical Dependencies:** List the top 5 most important third-party libraries/packages used in the project, categorized by their function (e.g., State Management, Data Fetching, UI Components, Utility).
2.  **Specialized Packages:** Identify and briefly describe the purpose of any highly specialized or non-standard packages.
    - _Example:_ `i18next` for internationalization, `D3.js` for complex data visualizations, `passport.js` for authentication.
3.  **Unique Data Flow/State Management:** Detail the specific methodology used for application-wide state management (e.g., Redux Toolkit, Zustand, Vuex, Context API). Describe where the core state logic resides and how components access and update it.

---

### **Section 3: Coding Standards & Principles**

1.  **Architectural Pattern:** Identify the primary architectural pattern being followed (e.g., MVC, MVVM, Component-Based, Layered Architecture).
2.  **Core Principles Followed:** List the 3-5 most critical software design principles actively enforced in the codebase (e.g., **DRY** (Don't Repeat Yourself), **KISS** (Keep It Simple, Stupid), **Separation of Concerns**, **SOLID principles**). Provide one brief, concrete example or location where this principle is well-applied.
3.  **Testing Strategy:** Briefly outline the testing approach. Are there Unit Tests, Integration Tests, or E2E Tests? Which testing framework is used (e.g., Jest, React Testing Library, Cypress)?

---

### **Section 4: Style Guide and Dos & Don'ts (LLM Directives)**

1.  **Basic Style Guide Directives:**
    - **Naming Conventions:** Specify required conventions for variables, functions, components, and files (e.g., `camelCase` for variables, `PascalCase` for Components, `kebab-case` for file names).
    - **Formatting:** Specify rules for semicolons (present/absent), quotes (single/double), and maximum line length (if applicable). _Refer to the existing Prettier/ESLint config if possible._
    - **Commenting:** Specify when and how comments should be used (e.g., JSDoc for public functions, minimal inline comments for self-explanatory code).
2.  **Required DOs (Best Practices for New Code):**
    - _Example:_ **DO** use modern ES6+ syntax (e.g., `const`/`let`, arrow functions).
    - _Example:_ **DO** include type definitions (TypeScript) for all new functions and component props.
    - _Example:_ **DO** utilize asynchronous utility functions (e.g., `Promise.all`) when performing parallel operations.
3.  **Forbidden DON'Ts (Anti-Patterns/Legacy Code to Avoid):**
    - _Example:_ **DON'T** use hardcoded strings for UI labels; use the dedicated internationalization (i18n) utility.
    - _Example:_ **DON'T** introduce side effects into presentational components; delegate all side effects to the service/store layer.
    - _Example:_ **DON'T** use `var` or unhandled exceptions (`try...catch` blocks are mandatory for all API calls).

---

### **Output Format Instructions**

The final output MUST be a single file named `llm-instruction.md` structured precisely with the headings and content specified above. The language must be clear, concise, and professional. Prioritize _factual, observable information_ from the codebase over assumptions.
