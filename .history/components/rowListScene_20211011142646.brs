sub init()
    m.SampleComponentLib = m.findNode("SampleComponentLib")
    m.SampleComponentLib.observeField("loadStatus", "libraryLoaded")
    m.MultiStyleLabel.drawingStyles = {

        "HandprintedRed": {
            "fontSize": 36
            "fontUri": "pkg:/fonts/vSHandprinted.otf"
            "color": "#FF0000FF"
        }
        "HandprintedGreen": {
            "fontSize": 36
            "fontUri": "pkg:/fonts/vSHandprinted.otf"
            "color": "#00FF00FF"
        }
        "default": {
            "fontSize": 36
            "fontUri": "font:LargeSystemFont"
            "color": "#000000FF"
        }
    }
    m.MultiStyleLabel.text = "Default Text <HandprintedRed>Red text followed by</HandprintedRed><HandprintedGreen>more text in a funny style thaty the world has never seen before...</HandprintedGreen>"
end sub

sub libraryLoaded()

end sub