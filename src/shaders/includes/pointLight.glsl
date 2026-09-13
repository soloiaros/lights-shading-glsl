vec3 pointLight(vec3 lightColor, float lightIntensity, vec3 normal, vec3 lightPosition, vec3 viewDirection, float specularPower, vec3 position) {
    vec3 lightDelta = lightPosition - position;
    vec3 lightDirection = normalize(lightDelta);
    vec3 lightReflection = reflect(- lightDirection, normal);

    // Shading
    float shading = max(0.0, dot(normal, lightDirection));

    // Specular
    float specular = max(0.0, - dot(lightReflection, viewDirection));
    specular = pow(specular, specularPower);
    
    return lightColor * lightIntensity * (shading + specular);
}