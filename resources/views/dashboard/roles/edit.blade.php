@extends('dashboard.master')
@section('titulo', 'Actualizar Role')
@section('contenido')
@include('dashboard.partials.validation-error')
  <h2 class="text-xl">Actualizar Rol</h2>
  <form action="{{ route('roles.update', $role->id) }}" method="post">
    @method('PUT')
    @csrf
    <div class="row">
      <div class="form-group">
        <label for="name">Nombre</label>
        <input class="form-control" type="text" name="name" id="name" value="{{ $role->name }}">
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
                <input class="form-check-input" type="checkbox" name="permission[]" value="{{ $permiso->id }}" {{ $role->permissions->contains($permiso->id) ? "checked" : ""}}>
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
  </form>
@endsection