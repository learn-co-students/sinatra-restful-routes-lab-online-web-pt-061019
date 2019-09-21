Adding edit form on the show.erb but rspec won't let me pass it

<form action="/recipes/<%= @recipe.id %>/edit" method="get">
    <input type="hidden" name="_method" value="edit">
     <input type="submit" value="edit">
</form>