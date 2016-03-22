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

function add_css_to_iframe(){
    var cssLink = document.createElement("link") 
    cssLink.href = "css/custom.css"; 
    cssLink.rel = "stylesheet"; 
    cssLink.type = "text/css"; 
    frames['search-frame'].document.body.appendChild(cssLink);
    frames['browse-frame'].document.body.appendChild(cssLink);
    frames['visualize-frame'].document.body.appendChild(cssLink);
};

$(document).ready(function(){
    reveal_search();
    // add_css_to_iframe();
});