@extends('dashboard.master')
@section('titulo', 'Editar Respuestas')
@section('contenido')
@include('dashboard.partials.validation-error')
  <h2 class="text-xl">Editar Respuesta</h2>
  <form action="{{ route('reply.update', $reply->id) }}" method="post">
    @method('PUT')
    @csrf
    <div class="row">
      <div class="form-group">
        <label for="text">Respuesta</label>
        <input class="form-control" type="text" name="text" id="text" value="{{ $reply->text }}">
        <input class="form-control" name="post_id" value="{{ $reply->post_id }}" hidden>
      </div>
    </div>
    <div class="row center mt-2">
      <div class="col s6">
        <button class="btn btn-success btn-sm bg-success" type="submit">Guardar</button>
        <a href="{{ route('post.show', $reply->post_id) }}" class="btn btn-primary btn-sm">Volver</a>
      </div>
    </div>
  </form>
@endsection