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

function generate_css_link(){
    var cssLink = document.createElement("link"); 
    // cssLink.href = "css/custom.css";
    cssLink.href = "http://mdata1.ad.wlu.edu/ShenandoahExplorer/css/custom.css";
    cssLink.rel = "stylesheet"; 
    cssLink.type = "text/css";
    return cssLink;
};

function add_css_to_iframe(){
    frames['search-frame'].document.head.appendChild(generate_css_link());
    frames['browse-frame'].document.head.appendChild(generate_css_link());
    frames['visualize-frame'].document.head.appendChild(generate_css_link());
    console.log('hello');
};

function prep_page(){
    add_css_to_iframe();    
    reveal_search();
};