@csrf
<div class="row">
  <div class="form-group">
    <label for="name">Nombre</label>
    <input class="form-control" type="text" name="name" id="name" value="{{ old('name') }}">
  </div>
</div>
<div class="row">
  <div class="form-group">
    <label for="name">Permisos</label>
    <table>
      <tbody>
        @foreach ($permission as $permiso)
        <tr>
          <td>
            <input class="form-check-input" type="checkbox" name="permission[]" value="{{ $permiso->id }}">
            {{ $permiso->name }}
          </td>
        </tr>          
        @endforeach
      </tbody>
    </table>
  </div>      
</div>
<div class="row center mt-2">
  <div class="col s6">
    <button class="btn btn-success btn-sm bg-success" type="submit">Guardar</button>
    <a href="{{ route('roles.index') }}" class="btn btn-primary btn-sm">Volver</a>
  </div>
</div>
