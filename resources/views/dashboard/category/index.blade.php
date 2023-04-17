@extends('dashboard.master')
@section('titulo', 'Categories')
@section('contenido')
  <h2 class="text-xl">Categorias</h2>
  @can('crear-category')
  <a class="btn btn-success mt-3 mb-3" href="{{ route('category.create') }}">Crear</a> 
  @endcan
  <table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">ID</th>
        <th scope="col">Nombre</th>
        <th scope="col">Creación</th>
        <th scope="col">Actualización</th>
        <th scope="col">Acciones</th>
      </tr>
    </thead>
    <tbody>
      @foreach ($categories as $category)
      <tr>
        <th scope="row">{{ $category->id }}</th>
        <td>{{ $category->name }}</td>
        <td>{{ $category->created_at }}</td>
        <td>{{ $category->updated_at }}</td>
        <td>
          <a class="btn btn-sm btn-primary " href="{{ route('category.show',$category->id) }}"><i class="fa fa-fw fa-eye"></i> Ver</a>
          @can('editar-category')
          <a class="btn btn-sm btn-success" href="{{ route('category.edit',$category->id) }}"><i class="fa fa-fw fa-edit"></i> Editar</a>
          @endcan
          @can('borrar-category')
          <button type="button" class="btn btn-danger btn-sm bg-red-500" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-id="{{ $category->id }}"> Eliminar</button>
          @endcan
        </td>
      </tr>
      @endforeach
    </tbody>
  </table>
  {{ $categories->links() }}
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>¿Seguro que desea borrar la Categoria?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary bg-secondary" data-bs-dismiss="modal">Cerrar</button>
          <form action="{{ route('category.destroy', $category->id) }}" method="POST" id="deleteForm">
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
      modalTitle.textContent = `Eliminar la categoria con el ID ${recipient}`
      var deleteForm = exampleModal.querySelector('#deleteForm')
      deleteForm.setAttribute('action', `http://mvclaravel.test/dashboard/category/${recipient}`)
    })
  </script>
@endsection
