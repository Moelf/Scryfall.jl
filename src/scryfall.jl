module scryfall

export getOracle, getImgurl

import HTTP
import JSON

function getRaw(fuzzyName::String;kwargs...)
    fuzzyName = HTTP.URIs.escapeuri(fuzzyName) #encode the fuzzyName for GET purpose
    kwargs = Dict(kwargs) #make keywords arguments a dictonary
    if haskey(kwargs, :setCode) #if 3-letter keyset is specified
        setCode = kwargs[:setCode]
        if length(setCode) == 3
            fuzzyRequest = HTTP.request("GET","https://api.scryfall.com/cards/named?set=$setCode&fuzzy=$fuzzyName")
        else
            Base.error("Length of setCode is incorrect, 3-letter only")
        end
    else #fallback to using anyset, let scryfall decide
        fuzzyRequest = HTTP.request("GET","https://api.scryfall.com/cards/named?set=&fuzzy=$fuzzyName")
    end
    cardDict = JSON.parse(String(fuzzyRequest.body)) #return a dictonary for wrapper functions to use
    return cardDict
end

# wrapper function for getting oracle
function getOracle(fuzzyName::String; kwargs...)
    return getRaw(fuzzyName; kwargs...)["oracle_text"]
end

# wrapper function for getting imgurl, the "normal" one
function getImgurl(fuzzyName::String; kwargs...)
    return getRaw(fuzzyName; kwargs...)["image_uris"]["normal"]
end

end
