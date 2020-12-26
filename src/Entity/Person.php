<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Person
 *
 * @ORM\Table(name="person", indexes={@ORM\Index(name="person-nationality", columns={"_nationality"}), @ORM\Index(name="person-role", columns={"_roleId"}), @ORM\Index(name="person-team", columns={"_teamId"})})
 * @ORM\Entity
 */
class Person
{
    /**
     * @var int
     *
     * @ORM\Column(name="personId", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $personid;

    /**
     * @var string
     *
     * @ORM\Column(name="firstName", type="string", length=255, nullable=false)
     */
    private $firstname;

    /**
     * @var string|null
     *
     * @ORM\Column(name="middleNames", type="string", length=255, nullable=true)
     */
    private $middlenames;

    /**
     * @var string
     *
     * @ORM\Column(name="lastName", type="string", length=255, nullable=false)
     */
    private $lastname;

    /**
     * @var string|null
     *
     * @ORM\Column(name="academicTitle", type="string", length=255, nullable=true)
     */
    private $academictitle;

    /**
     * @var string|null
     *
     * @ORM\Column(name="photoUrl", type="string", length=255, nullable=true)
     */
    private $photourl;

    /**
     * @var \Country
     *
     * @ORM\ManyToOne(targetEntity="Country")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_nationality", referencedColumnName="countryId")
     * })
     */
    private $nationality;

    /**
     * @var \Role
     *
     * @ORM\ManyToOne(targetEntity="Role")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_roleId", referencedColumnName="roleId")
     * })
     */
    private $roleid;

    /**
     * @var \Team
     *
     * @ORM\ManyToOne(targetEntity="Team")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_teamId", referencedColumnName="teamId")
     * })
     */
    private $teamid;

    public function getPersonid(): ?int
    {
        return $this->personid;
    }

    public function getFirstname(): ?string
    {
        return $this->firstname;
    }

    public function setFirstname(string $firstname): self
    {
        $this->firstname = $firstname;

        return $this;
    }

    public function getMiddlenames(): ?string
    {
        return $this->middlenames;
    }

    public function setMiddlenames(?string $middlenames): self
    {
        $this->middlenames = $middlenames;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }

    public function getAcademictitle(): ?string
    {
        return $this->academictitle;
    }

    public function setAcademictitle(?string $academictitle): self
    {
        $this->academictitle = $academictitle;

        return $this;
    }

    public function getPhotourl(): ?string
    {
        return $this->photourl;
    }

    public function setPhotourl(?string $photourl): self
    {
        $this->photourl = $photourl;

        return $this;
    }

    public function getNationality(): ?Country
    {
        return $this->nationality;
    }

    public function setNationality(?Country $nationality): self
    {
        $this->nationality = $nationality;

        return $this;
    }

    public function getRoleid(): ?Role
    {
        return $this->roleid;
    }

    public function setRoleid(?Role $roleid): self
    {
        $this->roleid = $roleid;

        return $this;
    }

    public function getTeamid(): ?Team
    {
        return $this->teamid;
    }

    public function setTeamid(?Team $teamid): self
    {
        $this->teamid = $teamid;

        return $this;
    }


}
