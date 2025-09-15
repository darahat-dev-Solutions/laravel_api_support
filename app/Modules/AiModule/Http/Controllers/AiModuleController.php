<?php

namespace App\Modules\AiModule\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Modules\AiModule\Models\AiModule;
use App\Modules\AiModule\Requests\AiModuleRequest;

class AiModuleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return AiModule::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(AiModuleRequest $request)
    {
        $aiModule = AiModule::create($request->validated());
        return response()->json($aiModule, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(AiModule $aiModule)
    {
        return $aiModule;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(AiModuleRequest $request, AiModule $aiModule)
    {
        $aiModule->update($request->validated());
        return response()->json($aiModule);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(AiModule $aiModule)
    {
        $aiModule->delete();
        return response()->json(null, 204);
    }
}