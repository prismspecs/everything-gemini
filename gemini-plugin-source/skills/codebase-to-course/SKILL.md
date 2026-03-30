# Codebase-to-Course Skill

Transform any repository into a beautiful, interactive, single-page HTML course. Inspired by the "vibe coding" patterns showcased by [zarazhangrui](https://github.com/zarazhangrui).

## When to Use
- When you need to explain a complex codebase to a new team member.
- When you want to create a "getting started" guide that feels alive.
- When you want to document a specific feature or architectural pattern as a tutorial.
- When you want to showcase your work in a way that is more engaging than a README.

## How it Works
1. **Repository Analysis**: The `course-designer` agent analyzes the codebase's core files, architecture, and logic.
2. **Pedagogical Structuring**: The agent breaks down the repository into logical "modules" (Introduction, Core Logic, Testing, Deployment, etc.).
3. **Interactive Generation**: The agent generates a standalone HTML file using **Tailwind CSS** and **Alpine.js** for a modern, reactive feel.
4. **Code Highlighting**: Uses `prism.js` or `shiki` (via CDN) for high-quality code blocks.

## Interactive Patterns (Zara Zhang Style)
- **Glassmorphism**: Use semi-transparent backgrounds with backdrop filters for a premium feel.
- **Scroll-Spy**: Navigation that updates automatically as the user reads through the course.
- **Progressive Disclosure**: Detailed code explanations that expand on click.
- **Interactive Checkpoints**: Small "knowledge checks" to keep the learner engaged.

## Example Output Structure

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <!-- Glassmorphism Theme -->
</head>
<body class="bg-slate-950 text-slate-200">
    <nav class="sticky top-0 bg-slate-900/80 backdrop-blur-md border-b border-white/10">
        <!-- Navigation -->
    </nav>
    <main class="max-w-4xl mx-auto py-12 px-6">
        <header class="mb-16">
            <h1 class="text-5xl font-bold bg-gradient-to-r from-blue-400 to-emerald-400 bg-clip-text text-transparent">
                Course: [Project Name]
            </h1>
        </header>
        <section id="module-1" class="mb-24">
            <!-- Module Content -->
        </section>
    </main>
</body>
</html>
```

## Related Agents
- `course-designer` - The specialized sub-agent that drives this skill.
