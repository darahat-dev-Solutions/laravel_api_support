<?php

namespace App\Modules\FormSubmission\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Modules\FormSubmission\Models\FormSubmission;
use App\Modules\FormSubmission\Requests\FormSubmissionRequest;

class FormSubmissionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return FormSubmission::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(FormSubmissionRequest $request)
    {
        $formSubmission = FormSubmission::create($request->validated());
        return response()->json($formSubmission, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(FormSubmission $formSubmission)
    {
        return $formSubmission;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(FormSubmissionRequest $request, FormSubmission $formSubmission)
    {
        $formSubmission->update($request->validated());
        return response()->json($formSubmission);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(FormSubmission $formSubmission)
    {
        $formSubmission->delete();
        return response()->json(null, 204);
    }
}
