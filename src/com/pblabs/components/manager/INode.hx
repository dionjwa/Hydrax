package com.pblabs.components.manager;

interface INode<Parent, Child>
	implements INodeChild<Parent>
{
	var children (get_children, null) :Array<Child>;
}
