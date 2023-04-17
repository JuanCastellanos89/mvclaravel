@extends('dashboard.master')
@section('titulo', 'Roles')
@section('contenido')
  <h2 class="text-xl">Roles</h2>
  @can('crear-rol')
  <a class="btn btn-success mt-3 mb-3" href="{{ route('roles.create') }}">Crear</a>
  @endcan  
  <table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">Rol</th>
        <th scope="col">Permisos</th>
        <th scope="col">Acciones</th>
      </tr>
    </thead>
    <tbody>
      @forelse ($roles as $role)
      <tr>
        <td>{{ $role->name }}</td>
        <td class="col-8">
        @forelse ($role->permissions as $permission)
        <span class="badge rounded-pill bg-dark">{{ $permission->name }}</span>            
        @empty
        <span class="badge text-bg-danger">No tiene permisos</span>
        @endforelse
        </td>
        <td>
          @can('editar-rol')
          <a class="btn btn-sm btn-success" href="{{ route('roles.edit',$role->id) }}"><i class="fa fa-fw fa-edit"></i> Editar</a>
          @endcan          
          @can('borrar-rol')
          <button type="button" class="btn btn-danger btn-sm bg-red-500" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-id="{{ $role->id }}"> Eliminar</button>
          @endcan
        </td>
      </tr>
      @empty
      <p>No existen roles</p>
      @endforelse
    </tbody>
  </table>
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>¿Seguro que desea eliminar el rol?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary bg-secondary" data-bs-dismiss="modal">Cerrar</button>
          <form action="{{ route('roles.destroy', 0) }}" method="post" id="deleteForm">
            @method('DELETE')
            @csrf
            <button type="submit" class="btn btn-danger bg-red-500">Eliminar</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <script>
    var exampleModal = document.getElementById('exampleModal')
    exampleModal.addEventListener('show.bs.modal', function(event) {
      var button = event.relatedTarget
      var recipient = button.getAttribute('data-bs-id')
      var modalTitle = exampleModal.querySelector('.modal-title')
      modalTitle.textContent = `Eliminar el rol con el ID ${recipient}`
      var deleteForm = exampleModal.querySelector('#deleteForm')
      deleteForm.setAttribute('action', `http://mvclaravel.test/dashboard/roles/${recipient}`)
    })
  </script>
@endsection