import os
import errno
import requests
import cloudinary
import cloudinary.api

cloudinary.config(cloud_name='gouvermxt', api_key='654732999378492', api_secret='cFLg7i_OTDThAe4V1R66V9gMeQY')

result = cloudinary.api.resources(max_results=500)
next_cursor = result['next_cursor']
results = result['resources']

base_path = '/mnt/f/backups-pimentagroup/nextstep-cloudinary/'

while next_cursor:
    for item in results:
        url = item['url']
        #'http://res.cloudinary.com/gouvermxt/image/upload/v1579471394/gqjizrcvpbuxg6igxto5.png'
        url_only = url.replace('http://res.cloudinary.com/', '')
        url_parts = url_only.split('/')

        path = base_path
        for url_part in url_parts:
            path = '{}/{}'.format(path, url_part)

        # Create path if not exists
        if not os.path.exists(os.path.dirname(path)):
            try:
                os.makedirs(os.path.dirname(path))
            except OSError as exc: # Guard against race condition
                if exc.errno != errno.EEXIST:
                    raise

        print("Saving file {}".format(path))
        
        content = requests.get(url, allow_redirects=True)

        with open(path, 'wb') as target_file:
            target_file.write(content.content)

    result = cloudinary.api.resources(max_results=500, next_cursor=next_cursor)
    next_cursor = result.get('next_cursor')
    results = result.get('resources')

print("Done")