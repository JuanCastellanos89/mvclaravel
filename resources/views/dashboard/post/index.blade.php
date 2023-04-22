@extends('dashboard.master')
@section('titulo', 'Post')
@section('contenido')
  <h2 class="text-xl">Posts</h2>
  @can('crear-post')
  <a class="btn btn-success mt-3 mb-3" href="{{ route('post.create') }}">Crear</a>
  @endcan
  <table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">Id</th>
        <th scope="col">Nombre</th>
        <th scope="col">Categoria</th>
        <th scope="col">Autor</th>
        <th scope="col">Estado publicación</th>
        <th scope="col">Creación</th>
        <th scope="col">Actualización</th>
        <th scope="col">Acciones</th>
      </tr>
    </thead>
    <tbody>
      @foreach ($posts as $post)
      <tr>
        <th scope="row">{{ $post->id }}</th>
        <td>{{ $post->name }}</td>
        <td>{{ $post->category->name}}</td>
        <td>{{ $post->autor->name}}</td>
        <td>{{ $post->state }}</td>
        <td>{{ $post->created_at }}</td>
        <td>{{ $post->updated_at }}</td>
        @if ($post->autor_id == Auth::user()->id)
        <td>
          <a href="{{ route('post.show', $post->id) }}" class="btn btn-primary btn-sm" title="ver">Ver</a>
          @can('editar-post')
          <a href="{{ route('post.edit', $post->id) }}" class="btn btn-sm btn-success" title="editar">Editar</a>
          @endcan          

          @can('borrar-post')
          <button type="button" class="btn btn-danger btn-sm bg-red-500" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-id="{{ $post->id }}">Eliminar</button>
          @endcan          
        </td>
        @else
          <td>
            <a href="{{ route('post.show', $post->id) }}" class="btn btn-primary btn-sm" title="ver">Ver</a>
          </td> 
        @endif        
      </tr>
      @endforeach
    </tbody>
  </table>
  {{ $posts->links() }}
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>¿Seguro que desea borrar el post?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary bg-secondary" data-bs-dismiss="modal">Cerrar</button>
          <form action="{{ route('post.destroy', 0) }}" method="post" id="deleteForm">
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
      modalTitle.textContent = `Eliminar post con el id ${recipient}`
      var deleteForm = exampleModal.querySelector('#deleteForm')
      deleteForm.setAttribute('action', `http://proyecto-test.test/dashboard/post/${recipient}`)
    })
  </script>
@endsection