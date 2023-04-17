@csrf
<div class="row">
  <div class="form-group">
    <label for="name">Titulo</label>
    <input class="form-control" type="text" name="name" id="name" value="{{ old('name', $category->name) }}">
  </div>
</div>
<div class="row">
  <div class="form-group">
    <label for="description">Contenido</label>
    <textarea class="form-control" name="description" id="description" rows="10">{{ old('description', $category->description) }}</textarea>
  </div>      
</div>
<div class="row center mt-2">
  <div class="col s6">
    <button class="btn btn-success btn-sm bg-success" type="submit">Guardar</button>
    <a href="{{ route('category.index') }}" class="btn btn-primary btn-sm">Volver</a>
  </div>
</div>
