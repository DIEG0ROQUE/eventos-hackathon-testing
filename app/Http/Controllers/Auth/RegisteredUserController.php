<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Participante;
use App\Models\Rol;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'nombre' => ['required', 'string', 'max:100'],
            'apellidos' => ['required', 'string', 'max:100'],
            'no_control' => ['required', 'string', 'max:20', 'unique:participantes,no_control'],
            'carrera_id' => ['required', 'exists:carreras,id'],
            'semestre' => ['required', 'integer', 'min:1', 'max:12'],
            'telefono' => ['nullable', 'string', 'max:15'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        // Crear usuario
        $nombreCompleto = $request->nombre . ' ' . $request->apellidos;
        
        $user = User::create([
            'name' => $nombreCompleto,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        // Asignar rol de participante por defecto
        $rolParticipante = Rol::where('nombre', 'participante')->first();
        if ($rolParticipante) {
            $user->roles()->attach($rolParticipante->id);
        }

        // Crear perfil de participante
        Participante::create([
            'user_id' => $user->id,
            'carrera_id' => $request->carrera_id,
            'no_control' => $request->no_control,
            'semestre' => $request->semestre,
            'telefono' => $request->telefono,
            'biografia' => 'Estudiante apasionado por la tecnología y la innovación.',
        ]);

        event(new Registered($user));

        Auth::login($user);

        return redirect(route('dashboard', absolute: false));
    }
}
