@extends('dashboard.master')
@section('titulo', 'Registrar Usuario')
@section('contenido')
@include('dashboard.partials.validation-error')
  <h2 class="text-xl">Registrar Usuario</h2>
  <form action="{{ route('usuario.store') }}" method="post">
    @include('dashboard.usuario._form')
  </form>
@endsection