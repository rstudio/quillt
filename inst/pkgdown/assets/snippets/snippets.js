

function loadSnippet(snippet, mode) {
  mode = mode || "markdown";
  $("#" + snippet).addClass("snippet");
  var editor = ace.edit(snippet);
  editor.setHighlightActiveLine(false);
  editor.setShowPrintMargin(false);
  editor.setReadOnly(true);
  editor.setShowFoldWidgets(false);
  editor.renderer.setDisplayIndentGuides(false);
  editor.setTheme("ace/theme/textmate");
  editor.$blockScrolling = Infinity;
  editor.session.setMode("ace/mode/" + mode);
  editor.session.getSelection().clearSelection();

  $.get("snippets/" + snippet + ".md", function(data) {
    editor.setValue(data, -1);
    editor.setOptions({
      maxLines: editor.session.getLength()
    });
  });
}

function relocateFunctions() {
  if (!document.querySelector('.template-reference-topic')) {
    return;
  }

  // grab functions and next element, the list of functions
  var fns = document.getElementById('functions');
  if (!fns) { return; }
  fns = [fns, fns.nextElementSibling];

  // locate usage section
  var usage = document.getElementById('usage');
  if (!usage) { return; }

  // Move Functions before Usage
  fns.forEach(function(el) {
    usage.parentElement.insertBefore(el, usage);
  });

  // Redraw Toc
  if (typeof window.Toc !== "undefined") {
    document.getElementById('toc').removeChild(document.querySelector('#toc .nav'))
    $('nav[data-toggle="toc"]').each(function(i, el) {
      var $nav = $(el);
      Toc.init($nav);
    });
  }
}
