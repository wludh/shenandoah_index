function reveal_browse(){
    $("#browse-div").addClass('visible');
    $("#search-div").removeClass('visible');
    $("#visualize-div").removeClass('visible');
};

function reveal_search(){
    $("#browse-div").removeClass('visible');
    $("#search-div").addClass('visible');
    $("#visualize-div").removeClass('visible');
};

function reveal_visualize(){
    $("#browse-div").removeClass('visible');
    $("#search-div").removeClass('visible');
    $("#visualize-div").addClass('visible');
};

$(document).ready(function(){
    reveal_search();
});