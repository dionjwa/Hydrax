package com.pblabs.components.manager;

interface INode<Parent, Child>
{
	var children (default, null) :Array<Child>;
	var parent (default, null) :Parent;
}
