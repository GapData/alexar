library(alexar)

#* @post /
#* @serializer unboxedJSON
function(req){
  dispatchAlexaRequest(req, intent=function(name, slots, attributes, ...){
    print(name)
    print(slots)
    print(attributes)
    if (name=="getcolor"){
      if (is.null(attributes$favoriteColor)){
        alexaResponse(output="I don't know! You need to tell me your favorite color first.")
      }
      alexaResponse(output=paste0("Your favorite color is ", attributes$favoriteColor))
    } else if (name == "setcolor"){
      alexaResponse(output=paste0("Great! I'll remember your favorite color next time you ask.",
                                  attributes=list(favoriteColor=slots$color)))
    }
  }, launch=function(...){
    alexaResponse("Tell this application what your favorite color is, then later you can ask it what your favorite color is.")
  })
}
