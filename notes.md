TODO next:
- get two apps talking to each other via the url template from index
- compare this to jsonhome/jsonapi format
- just move forward with whatever I have


```
APP_NAME=app-1-chi-winery
```

app_name is easier to check against ENV['app_name']

but if it doesn't match, grab the 'app_url' to use in the request

```
if ENV['APP_NAME'] == service_document['concept']['app_name']
  // local
else
  url = service_document['concept']['app_url']

end

```

concept, method, args =>
- should method actually be 'action'

what about nesting routes

wines/special/whatever/:type/:kind/:num

Should be in the URL template
url_template
url_variables


Let's make it all Hypermedia and shit and this abstract that all away
so we are left right back where we started?
What the hell did we gain?

We can change url's (move components around however the hell we want)
That is actually nice and enables us to build things out how we want at first
and offers flexibility to throw away or move or extract and scale, etc

Is that really worth it? Actually, yeah..? Otherwise, we always start
with the MVP version and it is shit and we just keep adding shit until there is shit everwhere


We want to build stuff quickly and easily and in as clean a manner as possible.
We want to test things out. Throw things away. Scale up and expand the things that work.
"Traveling Components" will enable this.


All of the service doc stuff may just be an extension to ruby-grape API's (somehow)
Or maybe I just need to include module that defines some stuff
But really I should be able to infer all service doc stuff from the Grape::API files
