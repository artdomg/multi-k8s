# Unix: $(pwd)
# Windows: ${pwd}
docker run -it -v $(pwd):/app ruby:2.3 sh
gem install travis
travis login --org
travis encrypt-file service-account.json -r artdomg/multi-k8s