@csrf
<div class="row">
  <div class="form-group">
    <label for="name">Titulo</label>
    <input class="form-control" type="text" name="name" id="name" value="{{ old('name', $post->name) }}">
  </div>
</div>
<div class="row">
  <div class="form-group">
    <label for="description">Contenido</label>
    <textarea class="form-control" name="description" id="description" rows="10">{{ old('description', $post->description) }}</textarea>
  </div>      
</div>
<div class="form-group">
  <label for="category_id">Categorias</label>
  <select class="form-select" name="category_id" id="category_id">
    @foreach ($categories as $category)
      <option value="{{ $category->id }}" {{ ($post->category_id) == $category->id ? 'selected' : null}}>{{ $category->name }}</option>
    @endforeach
  </select>
</div>
<div class="form-group">
  <label for="state">State</label>
  <select class="form-select" name="state" id="state">
    <option value="post" {{ ($post->state) == "post" ? 'selected' : null}}>post</option>
    <option value="no_post" {{ ($post->state) == "no_post" ? 'selected' : null}}>no_post</option>
  </select>
</div>
<div class="row center mt-2">
  <div class="col s6">
    <button class="btn btn-success btn-sm bg-success" type="submit">Publicar</button>
    <a href="{{ route('post.index') }}" class="btn btn-primary btn-sm">Volver</a>
  </div>
</div>