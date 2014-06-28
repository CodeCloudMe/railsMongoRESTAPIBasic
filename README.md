Rails & MongoDB on OpenShift: Simple Post UI / Restful API

For OpenShift:
When you create your application gear on OpenShift, be sure to select the Rails cartridge. 
The Rails cartridge comes with a Gitub repo already filled in, so keep that there.

Then, add the MongoDB cartridge (MongoDB  2.4) once OpenShift finishes creating your app. 

If you want to perform the MongoDB include  from your command line, you can run: 

rhc cartridge add mongodb-2.4 -a yourAppName

Now, cd into yourAppName (whatever "yourAppName" is. Mine was woowoorks.

Remove all the files with the following (inside your project folder in your terminal)
sudo rm -rf *



Run: 
git remote add upstream -m master http://github.com/CodeCloudMe/railsMongoRESTAPIBasic.git
git pull -s recursive -X theirs upstream master

You now have the code for this Demo example.

Now (from the terminal): 
git push upstream master

Now, login via ssh to your openshift server. In  OpenShit, after clicking on your application, click "Want to login to your application". Copy the "ssh 53ab76df5973c[...]"
" code

Paste that into your terminal.
Now, run:
rake secret

Copy the secret key that is displayed (should be many letters and numbers)

Find your openshift app name by locating it in the list after running "rch setup" from the command line.

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

You will need mondgodb running on your computer for this to work. If you don't have MondgoDB, install it here: 

From the unzipped folder location, open a new terminal for that directoy. Run: "sudo mongod".
MongoDB should start. Minimize this window. If you close this window, Mongo will stop and it will be hard to restart. (to stop properly from your terminal, run "Ctrl-C" in the terminal window in which Mongo is running).

Now you can navigate to: 0.0.0.0:3000/posts

***************

To make API calls via AJAX, you can write code like:
$.ajax({"url":"/posts/53add5954e696d6fab000000/", "method":"PATCH", "data":{"post[Title]":"hell", "post[Body]":"howdy", "format":"json"}})

Additional information about this configuration with Ruby and MongoDB can be found here: https://www.openshift.com/blogs/how-to-run-rails-4-with-mongodb-on-openshift. This example skips many of the steps involved in the above step-by-step and we take care of this for you. However, if you want to "do it all" yourself, you can follow this turorial; however, it does not mention the environment variable aspect, which you will need to complete by SSHing into your OpenShift gear, as we describe in the OpenShift config above.

More documentation on this can be found in the Marknad project on http://codecloud.me




