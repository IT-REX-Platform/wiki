# Common Issues

## After Logging In, I See a Blank Screen/Site Loads Forever

This is caused by the site missing SSL certificates. To fix this, visit https://orange.informatik.uni-stuttgart.de/graphql and
accept the "unsafe" warning of your browser there. Afterwards you can return to the site and after a refresh everything should work.

## I Can't Upload/View Media Files

This is caused by the site missing SSL certificates. To fix this, open your browser's developer tools (F12) and go to the console.
Then, again try uploading/viewing a file. In the dev console, a CORS error with the URL of the file you're trying to access should
be printed. Open this URL in a new tab and accept the "unsafe" warning of your browser there. Afterwards you can return to the site
and after a refresh all media files should be accessible.