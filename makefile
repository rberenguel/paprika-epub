ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >
.ONESHELL: # 

t="/Users/ruben/Library/Mobile\ Documents/com~apple~CloudDocs/Downloads/Paprika/Recipes"
path="/Users/ruben/Library/Mobile Documents/com~apple~CloudDocs/Downloads/Paprika/Recipes"
here=$(shell pwd)

$(t)/recipes.md: 
> cd $(path)
> pandoc -o recipes.md *html --from=html+raw_html --to=gfm --toc --metadata title="Paprika export `(date +"%Y%m%d")`"

$(t)/recipes.epub: $(t)/recipes.md
> cd $(path)
> pandoc -o recipes.epub recipes.md --from=gfm --to=epub --toc --metadata title="Paprika export `(date +"%Y%m%d")`" --metadata author="-" --toc-depth 1 --epub-cover-image $(here)/recipes-book.jpg

book: $(t)/recipes.epub