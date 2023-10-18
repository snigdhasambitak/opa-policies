package policy

# the allowed values for the tag 'env'
allowedEnvTags = {
 "prd",
 "stg",
 "dev"
}
#entry point for tags enforcement 
checkTags(resource) {
 # read the tags based on the resource type
 tags = readTags(resource.type, resource)
 # check for the tag enforcement
 ensureMandatoryTags(tags)
}
# every resource to be evaluated will have a 'readTags' function for # itself the returned document should resemble the below structure
# {'tag-name': {value: 'tag-value'}}
readTags("aws_instance", resource) = tags {
 tags = resource.changedAttributes.tags
}
#check if all the mandatory tags are available & have allowed values
ensureMandatoryTags(tags) {
 # check if the team name is provided
 checkTagHasValue(tags["team"])
#check if the service name is provided
 checkTagHasValue(tags["service"])
#check if the env is allowed value
 allowedEnvTags[tags["env"].value]
}
checkTagHasValue(tag) {
 re_match("[^\\s]+", tag.value)
}
