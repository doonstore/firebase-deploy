# Firebase CLI Deployment

A GitHub Action to deploy firebase hosting and functions together.

- Make sure you have the `firebase.json` file in the repository
- Get the Firebase token by running `firebase login:ci` and [store it](https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables) as the `FIREBASE_TOKEN` secret
- Set the project name in the `FIREBASE_PROJECT` secret

## Inputs

### `params`
**Optional** Additional command line arguments to `firebase` command. Defaults to empty.

## Example Workflows

```yaml
name: Default Deploy
on:
  push:
    branches:
    - master
jobs:
  main:
    name: Build and Deploy
    runs-on: ubuntu-latest
    steps:
    - name: Deploy to Firebase
      uses: doonstore/firebase-deploy@v1
      env:
        FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
        FIREBASE_PROJECT: ${{ secrets.FIREBASE_PROJECT }}
```

```yaml
name: Customized Deploy
on:
  push:
    branches:
    - master
jobs:
  main:
    name: Build and Deploy
    runs-on: ubuntu-latest
    steps:
    - name: Deploy to Firebase
      uses: doonstore/firebase-deploy@v1
      with:
        params: --only hosting
      env:
        FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
        FIREBASE_PROJECT: ${{ secrets.FIREBASE_PROJECT }}
```

## Notes
This repo is taken from [Deploy to Firebase](https://github.com/john-pickett/firebase-deploy) by [John Pickett](https://github.com/john-pickett) with only some minor edits. His repo works great, but I needed to be able to deploy to Firebase hosting and functions together. Thanks to John for the original repo.
