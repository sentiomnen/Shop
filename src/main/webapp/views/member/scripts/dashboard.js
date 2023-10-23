$(document).ready(function() {
    // Select tab and remove right border of left tab of selected.
    let selected_tab = new URL(window.location.href);
    selected_tab = selected_tab.searchParams.get('tab');

    let tab = $('nav.tab li');
    tab.each(function(i) {
        let $current = tab.eq(i);
        $current.removeClass('selected');
    });
    tab = $('nav.tab li#'+selected_tab);
    if (tab.length == 0) location.href = "/member?tab=account";
    tab.addClass('selected');
});
