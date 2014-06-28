Rails & MongoDB on OpenShift: Simple Blog UI / Restful API

For OpenShift:
When you create your application gear on OpenShift, be sure to select Ruby 1.9 (not Rails). Then, add the MongoDB cartridge (MongoDB  2.4)
Or run: 
rhc app create ruby-1.9 -a yourAppName
rhc cartridge add mongodb-2.4 -a yourAppName

Now, cd into yourAppName.
Run: 
git remote add upstream -m master http://github.com/CodeCloudMe/railsMongoRESTAPIBasic.git
git pull -s recursive -X theirs upstream master

Now: 
git push upstream master

Now, login via ssh to your openshift server. In  OpenShit, after clicking on your application, click "Want to login to your application". Copy the "ssh 53ab76df5973c[...]"
" code

Paste that into your terminal.
Now, run:
rake secret

Copy the secret key that is displayed (should be many letters and numbers)

Now run:
rhc set-env SECRET_KEY_BASE=**yourCodeFromTheServer** -a yourOpenShiftAppName

Now restart your app:
rhc app-stop yourOpenShiftAppName
rhc app-start yourOpenShiftAppName

Navigate to your OpenShift URL once that's complete and you should see this:
http://woowoorks-tester588.rhcloud.com/posts

You can now CRUD posts with Rails and MongoDB.
To add new models, within your application run:

rails g scaffold SomeModel Title:string Body:string created_at:Date, updated_at:Date

To edit models, go to app/models/youModelName.rb once you create it, and you can add fields.

********

For your Local Computer (Mac)
Note: for any commands that "don't work", try adding "sudo" before your command and seeing if you get a different result.
To get started, make sure you have ruby installed, by running "ruby -v" from your command line.

OpenShift will "bundle install" this application and get the dependencies for you but your local computer will not.

Navigate into your app folder where this code resides in your terminal.

Hit:
bundle install

Once that completes (will take a few moments), type into your terminal:
rails server

Now you can navigate to: 0.0.0.0:3000/posts

***************

To make API calls via AJAX, you can write code like:
$.ajax({"url":"/posts/53add5954e696d6fab000000/", "method":"PATCH", "data":{"post[Title]":"hell", "post[Body]":"howdy", "format":"json"}})

More documentation on this can be found in the Marknad project on CodeCloud.me




