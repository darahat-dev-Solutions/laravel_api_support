<?php

namespace Modules\AiModule\Http\Controllers;

use App\Http\Controllers\Controller;
use Modules\AiModule\Models\AiModule;
use Modules\AiModule\Http\Requests\AiModuleRequest;

class AiModuleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $modules = AiModule::select('id','name','prompt','description','tools')->get();

        /// Decode tools for each module(need to tool make a real json array of object)
        $modules->transform(function ($module){
            $module->tools = json_decode($module->tools, true);
            return $module;
        });
        return $modules;
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
