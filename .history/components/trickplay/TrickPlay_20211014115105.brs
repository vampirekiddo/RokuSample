sub init()
    initItems()
end sub

sub initItems()
    m.mainParent = m.top.findNode("mainParent")
    m.elapsedTime = m.mainParent.findNode("elapsedTime")
    m.ScrubberFilled = m.mainParent.findNode("ScrubberFilled")
    m.ScrubberContainer = m.mainParent.findNode("ScrubberContainer")
    m.remainingTime = m.mainParent.findNode("remainingTime")
    m.bottomButtons = m.top.findNode("bottomButtons")
    m.back15 = m.bottomButtons.findNode("back15")
end sub