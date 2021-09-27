sub init()
    m.keyboardController = m.top.findNode("keyboardController")
    initButtons()
    m.focusIdx = 0
    m.Col1.setFocus(true)
    initObservers()
end sub

sub initButtons()
    m.Col1 = m.top.findNode("Col1")
    m.Col2 = m.top.findNode("Col2")
    m.Col3 = m.top.findNode("Col3")
    m.Col4 = m.top.findNode("Col4")
    m.Col5 = m.top.findNode("Col5")
    m.Col6 = m.top.findNode("Col6")
    m.Col7 = m.top.findNode("Col7")
    m.Col8 = m.top.findNode("Col8")
    m.Col9 = m.top.findNode("Col9")
    m.textBox = m.top.findNode("textBox")
    m.Col1.buttons = ["A", "J", "S", "1"]
    m.Col2.buttons = ["B", "K", "T", "2"]
    m.Col3.buttons = ["C", "L", "U", "3"]
    m.Col4.buttons = ["D", "M", "V", "4"]
    m.Col5.buttons = ["E", "N", "W", "5"]
    m.Col6.buttons = ["F", "O", "X", "6"]
    m.Col7.buttons = ["G", "P", "Y", "7"]
    m.Col8.buttons = ["H", "Q", "Z", "8"]
    m.Col9.buttons = ["I", "R", "0", "9"]
end sub

sub handleItemSelected(event)
    ?event.getData()
end sub

sub initObservers()
    m.Col1.observeField("buttonSelected", "handleItemFocus")
    m.Col2.observeField("buttonSelected", "handleItemFocus")
    m.Col3.observeField("buttonSelected", "handleItemFocus")
    m.Col4.observeField("buttonSelected", "handleItemFocus")
    m.Col5.observeField("buttonSelected", "handleItemFocus")
    m.Col6.observeField("buttonSelected", "handleItemFocus")
    m.Col7.observeField("buttonSelected", "handleItemFocus")
    m.Col8.observeField("buttonSelected", "handleItemFocus")
    m.Col9.observeField("buttonSelected", "handleItemFocus")
end sub

sub handleItemFocus(event)
    text = event.getRoSGNode().getChild(event.getData()).text
    if text = " SPACE   "
        m.textBox.text += " "
    else if text = "DELETE"
        m.textBox.text = ""
    else
        m.textBox.text += text
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press
        if key = "right" and m.focusIdx < 8
            rowIdx = m.keyboardController.getChild(m.focusIdx).buttonFocused
            m.focusIdx++
            m.keyboardController.getChild(m.focusIdx).focusButton = rowIdx
            return true
        else if key = "left" and m.focusIdx > 0
            rowIdx = m.keyboardController.getChild(m.focusIdx).buttonFocused
            m.focusIdx--
            m.keyboardController.getChild(m.focusIdx).focusButton = rowIdx
            return true
        end if
    end if
    return false
end function