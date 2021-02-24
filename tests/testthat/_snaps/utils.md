# create a thumbnail with provided information

    Code
      thumbnail("title", "path/to/img", "website.org")
    Output
      <div class="col-sm-4">
        <a class="thumbnail" title="title" href="website.org">
          <img src="path/to/img"/>
          <div class="caption">title</div>
        </a>
      </div>

---

    Code
      thumbnail("title", "path/to/img", "website.org", caption = FALSE)
    Output
      <div class="col-sm-4">
        <a class="thumbnail" title="title" href="website.org">
          <img src="path/to/img"/>
          <div class=""></div>
        </a>
      </div>

---

    Code
      thumbnail("title", "path/to/img", "website.org", caption = TRUE, source = "repo.org/source")
    Output
      <div class="col-sm-4">
        <a class="thumbnail" title="title" href="website.org">
          <img src="path/to/img"/>
          <div class="caption">
            title
            <object>
              <a class="source-repo" href="repo.org/source">(Source)</a>
            </object>
          </div>
        </a>
      </div>

---

    Code
      thumbnail("title", "path/to/img", "website.org", caption = FALSE, source = "repo.org/source")
    Output
      <div class="col-sm-4">
        <a class="thumbnail" title="title" href="website.org">
          <img src="path/to/img"/>
          <div class=""></div>
        </a>
      </div>

# create thumbnails of 3 columns

    Code
      thumbnails(thumbs1)
    Output
      <div class="row">
        div
        col-sm-4
        <a class="thumbnail" title="title" href="website.org">
          <img src="path/to/img"/>
          <div class="caption">title</div>
        </a>
      </div>

---

    Code
      thumbnails(list(thumbs1, thumbs2))
    Output
      <div class="row">
        <div class="col-sm-4">
          <a class="thumbnail" title="title" href="website.org">
            <img src="path/to/img"/>
            <div class="caption">title</div>
          </a>
        </div>
        <div class="col-sm-4">
          <a class="thumbnail" title="title" href="website.org">
            <img src="path/to/img"/>
            <div class=""></div>
          </a>
        </div>
      </div>

---

    Code
      thumbnails(list(thumbs1, thumbs2, thumbs3))
    Output
      <div class="row">
        <div class="col-sm-4">
          <a class="thumbnail" title="title" href="website.org">
            <img src="path/to/img"/>
            <div class="caption">title</div>
          </a>
        </div>
        <div class="col-sm-4">
          <a class="thumbnail" title="title" href="website.org">
            <img src="path/to/img"/>
            <div class=""></div>
          </a>
        </div>
        <div class="col-sm-4">
          <a class="thumbnail" title="title" href="website.org">
            <img src="path/to/img"/>
            <div class="caption">
              title
              <object>
                <a class="source-repo" href="repo.org/source">(Source)</a>
              </object>
            </div>
          </a>
        </div>
      </div>

---

    Code
      thumbnails(list(thumbs1, thumbs2, thumbs3, thumbs1))
    Output
      <div class="row">
        <div class="col-sm-4">
          <a class="thumbnail" title="title" href="website.org">
            <img src="path/to/img"/>
            <div class="caption">title</div>
          </a>
        </div>
        <div class="col-sm-4">
          <a class="thumbnail" title="title" href="website.org">
            <img src="path/to/img"/>
            <div class=""></div>
          </a>
        </div>
        <div class="col-sm-4">
          <a class="thumbnail" title="title" href="website.org">
            <img src="path/to/img"/>
            <div class="caption">
              title
              <object>
                <a class="source-repo" href="repo.org/source">(Source)</a>
              </object>
            </div>
          </a>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-4">
          <a class="thumbnail" title="title" href="website.org">
            <img src="path/to/img"/>
            <div class="caption">title</div>
          </a>
        </div>
      </div>

# Specify examples in YAML

    Code
      examples(yaml)
    Output
      <div class="row">
        <div class="col-sm-4">
          <a class="thumbnail" title="title" href="website.org">
            <img src="path/to/img"/>
            <div class="caption">title</div>
          </a>
        </div>
        <div class="col-sm-4">
          <a class="thumbnail" title="showcase TRUE" href="website.org">
            <img src="path/to/img"/>
            <div class="caption">showcase TRUE</div>
          </a>
        </div>
        <div class="col-sm-4">
          <a class="thumbnail" title="shiny TRUE" href="website.org">
            <img src="path/to/img"/>
            <div class="caption">shiny TRUE</div>
          </a>
        </div>
      </div>

---

    Code
      examples(yaml, showcaseOnly = TRUE)
    Output
      <div class="row">
        <div class="col-sm-4">
          <a class="thumbnail" title="showcase TRUE" href="website.org">
            <img src="path/to/img"/>
            <div class="caption">showcase TRUE</div>
          </a>
        </div>
      </div>

---

    Code
      examples(yaml, shinyOnly = TRUE)
    Output
      <div class="row">
        <div class="col-sm-4">
          <a class="thumbnail" title="shiny TRUE" href="website.org">
            <img src="path/to/img"/>
            <div class="caption">shiny TRUE</div>
          </a>
        </div>
      </div>

