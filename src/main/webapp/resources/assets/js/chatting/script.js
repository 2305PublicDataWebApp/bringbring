var element = $('.floating-chat');


// setTimeout(function() {
//     element.addClass('enter');
// }, 1000);

element.click(openElement);

function openElement() {
    var messages = element.find('.messages');
    element.find('>i').hide();
    // element.addClass('expand');
    element.find('.chat').addClass('enter');
    element.off('click', openElement);
    // messages.scrollTop(messages.prop("scrollHeight"));
}

