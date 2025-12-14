# tweaks-repository

A Debian package repository for iOS tweaks.

## Adding a New Package

To add a new `.deb` package to this repository:

### Prerequisites

Install required tools (macOS):
```bash
brew install dpkg zstd
```

### Steps

1. **Add your `.deb` file** to the `debs/` directory:
   ```bash
   cp /path/to/your/package.deb debs/
   ```

2. **Regenerate the Packages file**:
   ```bash
   dpkg-scanpackages -m . /dev/null > Packages
   ```

3. **Compress the Packages file** (optional but recommended):
   ```bash
   bzip2 -fk Packages
   gzip -fk Packages
   ```

4. **Update the Release file**:
   ```bash
   ./update-release.sh
   ```

5. **Commit and push changes**:
   ```bash
   git add .
   git commit -m "Add new package: your-package-name"
   git push
   ```

### Quick Script

You can automate the entire process:
```bash
dpkg-scanpackages -m . /dev/null > Packages && bzip2 -fk Packages && gzip -fk Packages && ./update-release.sh
```

### Repository URL

Add this URL to Sileo/Cydia:
```
https://enzodjabali.github.io/tweaks-repository/
```