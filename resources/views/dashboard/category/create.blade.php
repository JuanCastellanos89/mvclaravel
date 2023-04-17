@extends('dashboard.master')
@section('titulo', 'Registrar Category')
@section('contenido')
@include('dashboard.partials.validation-error')
  <h2 class="text-xl">Registrar Categoria</h2>
  <form action="{{ route('category.store') }}" method="post">
    @include('dashboard.category._form')
  </form>
@endsection