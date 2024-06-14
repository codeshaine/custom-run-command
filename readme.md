### Overview

The custom run command script facilitates compiling and executing various programming language files directly from the command line. It supports languages like C++, Java, C, Python, JavaScript, TypeScript, Go, and Rust.

#### Installation

##### Linux

1. **Download the Script:**

   - Download the `run` script to a directory of your choice. It's recommended to create a dedicated directory for scripts.

2. **Set Up Alias:**

   - Open your terminal.
   - Edit `~/.bashrc` (or `~/.zshrc` if using Zsh) using a text editor.
   - Add the following line at the end of the file:
     ```
     alias run="/path/to/run"
     ```
     Replace `/path/to/run` with the actual path where you placed the `run` script.

3. **Apply Changes:**
   - Save and close the file.
   - Source the updated profile:
     ```
     source ~/.bashrc   # or source ~/.zshrc if using Zsh
     ```

##### Windows (Using Git Bash)

1. **Download the Script:**

   - Download the `run` script to a directory of your choice. You can place it in your home directory or any convenient location.

2. **Set Up Alias:**

   - Open Git Bash.

   - If you don't have a `.bash_profile` file in your home directory, create one:

     ```
     touch ~/.bash_profile
     ```

   - Edit `~/.bash_profile` using a text editor (e.g., `nano ~/.bash_profile`).

   - Add the following line at the end of the file:
     ```
     alias run="/c/path/to/run"
     ```
     Replace `/c/path/to/run` with the actual path where you placed the `run` script, adjusting the drive letter as necessary (`/c` for C drive, `/d` for D drive, etc.).

3. **Apply Changes:**

   - Save and close the file.

   - Source the updated profile:
     ```
     source ~/.bash_profile
     ```

#### Usage

Once installed and set up, you can use the `run` command followed by the filename you want to compile and execute. Here’s how you can use it:

```bash
run filename.extension
```

Replace `filename.extension` with the actual filename and its extension.

#### Options

- **Debug Mode (`-d`):** For JavaScript and TypeScript files, this option runs them with `nodemon` for automatic restart on file changes.

  ```bash
  run -d filename.js   # or filename.ts
  ```

- **Help (`-h`):** Displays usage instructions.
  ```bash
  run -h
  ```

#### Examples

- **Compile and run a C++ file:**

  ```bash
  run hello.cpp
  ```

- **Compile and run a Python file:**

  ```bash
  run script.py
  ```

- **Run a JavaScript file in debug mode using nodemon:**
  ```bash
  run -d app.js
  ```

#### Notes

- Ensure the script has execute permissions:

  ```bash
  chmod +x /path/to/run
  ```

- Supported file extensions include `.cpp`, `.c`, `.java`, `.py`, `.js`, `.ts`, `.go`, `.rs`. Unsupported files or extensions will trigger an error.

#### Uninstallation

To uninstall, remove the alias from your shell profile (`~/.bashrc`, `~/.zshrc`, or `~/.bash_profile`), delete the `run` script, and optionally delete any associated directories.

### Conclusion

The `run` script streamlines the process of compiling and executing code across multiple programming languages from a single command, enhancing development efficiency and convenience.

This documentation now includes a dedicated help option (`-h`) and clarifies the use of `-d` for JavaScript files when using `nodemon`, ensuring comprehensive usage instructions for users.
