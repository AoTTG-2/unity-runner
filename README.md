# Unity - Runner
[![CI](https://github.com/MirrorNG/unity-runner/workflows/CI/badge.svg)](https://github.com/MirrorNG/unity-runner/actions?query=workflow%3ACI)

---

GitHub Action to 
[run unity](https://github.com/marketplace/actions/unity-test-runner) 
for any Unity project. 

---

This is a recommended step to prepare your pipeline for using the 
[Build](https://github.com/webbertakken/unity-actions#build)
action. This action also requires the [activation](https://github.com/marketplace/actions/unity-activate) step.

## Documentation

See the 
[Unity Actions](https://github.com/webbertakken/unity-actions)
collection repository for workflow documentation and reference implementation.

## Usage

Create or edit the file called `.github/workflows/main.yml` and add a job to it.

```yaml
name: Test project
on: [push]
jobs:
  testRunnerInAllModes:
    name: Test all modes ✨
    runs-on: ubuntu-latest
    steps:
```

Configure the test runner as follows:

```yaml
      # Configure test runner
      - name: Run tests
        id: myTestStep
        uses: webbertakken/unity-test-runner@v1.1
        env:
          # Choose: "all", "playmode", "editmode"
          TEST_MODE: all
          
          # Optional: Path to your project, leave blank for "./"
          PROJECT_PATH: relative/path/to/your/project

          # Optional: Artifacts path, leave blank for "artifacts"
          ARTIFACTS_PATH: store/artifacts/here
```

You use the id to **upload the artifacts** like so:

```yaml
      # Upload artifacts
      - name: Upload test results
        uses: actions/upload-artifact@v1
        with:
          name: Test results
          path: ${{ steps.myTestStep.outputs.artifactsPath }}
```

Commit and push your workflow definition.

## More actions

Visit 
[Unity Actions](https://github.com/webbertakken/unity-actions) 
to find related actions for Unity.

Feel free to contribute.

## Licence 

[MIT](./LICENSE)
