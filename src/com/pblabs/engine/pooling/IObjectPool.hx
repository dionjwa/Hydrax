package com.pblabs.engine.pooling;

interface IObjectPool
{
    function addObject<T> (obj :T) :Void;
    function getObject <T> (cls :Class<T>) :T;
}
