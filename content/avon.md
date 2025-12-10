# Avon: File Generation for Creative Developers

**Avon** is a elegant, powerful template language that turns repetitive file generation into maintainable code. Instead of copy-pasting configs, scripts, and boilerplate, Avon lets you write one program that generates them all.

Whether you're managing Kubernetes manifests, setting up CI/CD pipelines, generating boilerplate code, or just tired of maintaining 50 nearly identical YAML files—Avon is built for you.

*In fact, this entire website is generated using Avon!*

## Quick Start: Your First Program

Create a file called `hello.av`:

```avon
let name = "World" in
let greeting = "Hello" in

@hello.txt {"
{greeting}, {name}!
Welcome to Avon.
"}
```

Preview it:

```bash
avon eval hello.av
```

Deploy it (write to disk):

```bash
avon deploy hello.av --root ./output
```

This creates `./output/hello.txt`. That's the core pattern: define variables → use them in templates → attach to file paths → deploy.

**The three key types:**

- `@hello.txt` — A Path (file destination)
- `{"..."}` — A Template (content with `{variable}` placeholders)
- `@path {"..."}` — A FileTemplate (the unit Avon deploys)

## The Superpower: `@` Deployment

The magic of Avon is simple: use the `@` syntax to define exactly where a file should go, right inside your code.

```avon
let port = 8080 in
let env = "production" in

@config/app.yml {"
server:
  port: {port}
  environment: {env}
  debug: {if env == "production" then "false" else "true"}
"}
```

When you run `avon --deploy`, the file is created instantly. No complex tooling. No build scripts. Just elegant, composable code.

## Template Syntax

Templates in Avon use the `{"` and `"}` delimiters. Everything inside is interpolated—use `{expression}` to insert dynamic values:

```avon
let name = "Alice" in
@greeting.txt {"
Hello, {name}!
Welcome to Avon.
"}
```

Avon automatically handles indentation: it strips leading whitespace based on the first content line's indentation, so you can indent templates in your source for readability without affecting output.

### Handling Literal Braces

When you need literal braces (like in JSON or JavaScript), use the multi-brace delimiter system:

**Single braces `{"` `"}`** — Use `{expr}` to interpolate. No literal braces.

```avon
let name = "Alice" in {"Hello, {name}!"}
```

**Double braces `{{"` `"}}`** — Use `{{expr}}` to interpolate. Single `{` and `}` are literal.

```avon
let x = 5 in {{"Value: {{x}} and literal {braces}"}}
```

**Triple braces `{{{"` `"}}}`** — Use `{{{expr}}}` to interpolate. Single `{` and `{{` are literal.

```avon
let name = "Alice" in {{{"
class MyClass {
  constructor() {
    this.name = "{{{name}}}";
  }
}
"}}}
```

Perfect for generating JSON, code, or template syntax without escaping.

## Generate One File, or Hundreds

Generate multiple files by returning a list:

```avon
let environments = ["dev", "staging", "prod"] in
map (\env @config-{env}.yml {"
environment: {env}
debug: {if env == "prod" then false else true}
"}) environments
```

One program. Three files. Each customized automatically. No copy-paste. No mistakes.

Functions use `\parameter expression` syntax. This example uses `map` to apply a function to each environment, creating a FileTemplate for each.

## The --git Workflow: Share One Template, Deploy Everywhere

Fetch and deploy templates directly from GitHub:

```bash
avon deploy --git pyrotek45/avon/examples/config.av --root ~/.config -env prod -user alice
```

Keep one Avon file in git. Deploy customized versions on every machine. Everyone shares the same source, but each deployment adapts via CLI arguments. No more "can you send me your config?"

## Why Avon?

- **Single Expression** — Every Avon file is one clean expression. Import and compose programs together effortlessly.
- **No Dependencies** — Avon is a single binary. Download it and go.
- **First-Class Paths & Templates** — `@path {"content"}` makes file destinations part of your language, not an afterthought.
- **Atomic Deployments** — Files are written safely. No partial or corrupted deployments.
- **Functional Programming** — Variables, functions, map/filter/fold, currying, runtime type checking.
- **111 Built-in Functions** — String manipulation, lists, dicts, regex, file I/O, HTML/Markdown helpers, and more.

## More Than Configuration

Because Avon is a full programming language with 100+ built-in functions, you can use it for creative tasks beyond config files:

- **Scaffold new project structures** — Generate entire directory layouts with starter code
- **Generate boilerplate** — Eliminate template code for different languages
- **Manage dotfiles** — One `.vimrc.av` in git, customized deployments for each machine
- **Build CI/CD pipelines** — Dynamic workflows that adapt to your project structure
- **Create HTML or documentation** — Use loops and templates to generate static content
- **Anything text-based** — YAML, JSON, TOML, HCL, shell scripts, Terraform, Kubernetes manifests, you name it

## Core Commands

```bash
avon eval program.av              # Preview output (no files written)
avon deploy program.av --root ./  # Write files to disk
avon run 'expr'                   # Evaluate expression directly
avon repl                         # Interactive exploration
avon doc                          # Built-in function reference
```

## How Deployment Works

When you run `avon deploy program.av`, Avon evaluates your program:

- If it returns a **Function** — CLI arguments are applied to it
- If it returns a **FileTemplate** — It's written to disk
- If it returns a **List of FileTemplates** — They're all deployed

```avon
# Returns a function - CLI args are applied
\env @config-{env}.yml {"environment: {env}"}

# Returns a FileTemplate - deployed directly  
@config.yml {"port: 8080"}

# Returns a list of FileTemplates - all are deployed
[
  @config.yml {"port: 8080"},
  @settings.yml {"debug: true"}
]
```

## A Vision for Creative File Generation

Avon exists because developers deserve better than copy-paste. I built it hoping people would find creative uses I never imagined. Generate API clients. Build documentation sites. Create personalized dev environments. Use it as a templating engine for your side projects.

The possibilities are limited only by your imagination. Give your files superpowers with Avon.

## Get Started

Avon is a single binary with no dependencies:

```bash
# Download from https://github.com/pyrotek45/avon

# Create a simple program
echo 'let greeting = "Hello" in @greet.txt "{greeting}, World!"' > hello.av

# Deploy it
avon hello.av --deploy --root ./output --force

# Your file is generated!
cat ./output/greet.txt
```

Explore more examples at [github.com/pyrotek45/avon](https://github.com/pyrotek45/avon).

Stop managing files by hand. Give them superpowers with Avon.
